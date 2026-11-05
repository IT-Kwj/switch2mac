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
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _114 = false;
    bool _112 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _354 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_354, float2(0.0), isnan(_354))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_354, float2(0.0), isnan(_354))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = -_66;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_66;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _78 = !_72;
    uint _81 = uint(_78 ? 0 : 1);
    uint _83 = 2u;
    if (!_72)
    {
        _83 = 1u;
    }
    uint _85 = _83;
    uint _87 = _85;
    if (!_76)
    {
        _87 = _81;
    }
    uint _89 = _87;
    uint _91 = min(_89, 2u);
    int _94 = int(_91) << 2;
    float _96 = _66 * _56;
    float _98 = _66 * _54;
    uint _100 = uint(int(uint(_94) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    bool _108 = as_type<int>(_106) == 368;
    if (!_108)
    {
        bool _110 = as_type<int>(_106) == 640;
        _112 = _110;
        if (!_112)
        {
            _114 = true;
        }
    }
    float _148;
    float _150;
    float _152;
    float _154;
    if (!_112)
    {
        if (!_114)
        {
            float _116 = _98 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _118 = _98 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _120 = _98 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _122 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _124 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
            float _126 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
            float _128 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
            float _130 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[3].x, _122);
            float _132 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _130);
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _148 = _146;
            _150 = _140;
            _152 = _142;
            _154 = _144;
        }
    }
    if ((false || _114) || _112)
    {
        if ((!_114) || _112)
        {
            _112 = false;
            float _156 = _98 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _158 = _98 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _160 = _98 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _162 = _98 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _164 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].x, _156);
            float _166 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[5].x, _158);
            float _168 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
            float _170 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[7].x, _162);
            float _172 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _170);
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _148 = _186;
            _150 = _180;
            _152 = _182;
            _154 = _184;
        }
        if (false || _114)
        {
            _114 = false;
            float _188 = _98 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _190 = _98 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _192 = _98 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _194 = _98 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _196 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[8].x, _188);
            float _198 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[9].x, _190);
            float _200 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[10].x, _192);
            float _202 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[11].x, _194);
            float _204 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _202);
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _148 = _218;
            _150 = _212;
            _152 = _214;
            _154 = _216;
        }
    }
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _98 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _230 = _98 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _232 = 1.0 / _220;
    float _234 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[15].x, _228);
    float _236 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[13].x, _230);
    float _238 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _234);
    float _240 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _236);
    float _242 = _238 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _244 = _98 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _246 = _240 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _248 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[12].x, _244);
    float _250 = 1.0 / _242;
    float _252 = _232 * _222;
    float _254 = _232 * _224;
    float _256 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _248);
    float _258 = _232 * _226;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = _256 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _264 = _262 * _250;
    float _266 = _246 * _250;
    float _268 = float(int(_89));
    float2 _811 = float2(_264, _266);
    float2 _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_811, float2(0.0), isnan(_811))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_811, float2(0.0), isnan(_811))).xy;
    float _274 = _272.x;
    float _276 = _272.y;
    float _278 = rint(_268);
    float _280 = precise::max(_278, 0.0);
    uint _282 = uint(_280);
    uint _284 = clamp(_282, 0u, 65535u);
    float3 _837 = float3(_252, _254, float(int(_284)));
    float3 _841 = select(_837, float3(0.0), isnan(_837));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _841.xy, uint(rint(_841.z)), _260);
    float _288 = _98 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _290 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[14].x, _288);
    float _292 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _290);
    float _294 = _292 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _296 = precise::min(_294, 1.0);
    float _298 = -_66;
    float _300 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _302 = _298 + _300;
    float _304 = _302 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = -_274;
    float _310 = fma(_308, _274, _276);
    float _312 = -_274;
    float _314 = _296 + _312;
    float _316 = -_66;
    float _318 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _320 = _316 + _318;
    float _322 = fma(_314, _314, _310);
    bool _324 = _314 <= 0.001000000047497451305389404296875;
    float _326 = float(_324);
    float _328 = _320 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = 1.0 / _322;
    float _334 = _286 + _330;
    float _336 = _310 * _332;
    float _338 = precise::max(_336, _326);
    float _340 = precise::min(_338, 1.0);
    float _342 = _340 + _306;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _334;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _342;
    return out;
}

