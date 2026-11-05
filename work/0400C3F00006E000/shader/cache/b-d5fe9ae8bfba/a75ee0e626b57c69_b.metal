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
    bool _120 = false;
    bool _118 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _360 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_360, float2(0.0), isnan(_360))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_360, float2(0.0), isnan(_360))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = -_62;
    bool _68 = _64 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _70 = -_62;
    bool _72 = _70 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _74 = -_62;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _78 = !_68;
    int _81 = _78 ? 0 : 1;
    int _83 = 2;
    if (!_68)
    {
        _83 = 1;
    }
    int _85 = _83;
    int _87 = _85;
    if (!_72)
    {
        _87 = _81;
    }
    int _89 = _87;
    int _91 = _89 + 1;
    uint _94 = uint(_91);
    if (!_76)
    {
        _94 = uint(_89);
    }
    uint _96 = _94;
    uint _98 = min(_96, 2u);
    int _100 = int(_98) << 2;
    float _102 = _62 * _56;
    float _104 = _62 * _54;
    uint _106 = uint(int(uint(_100) >> uint(2)));
    uint _108 = uint(int(uint(int(_106)) >> uint(2)));
    int _110 = int(_106) & 3;
    float _112 = (*spvDescriptorSet0.fp_c1)._m0[int(_108)][_110];
    bool _114 = as_type<int>(_112) == 384;
    if (!_114)
    {
        bool _116 = as_type<int>(_112) == 656;
        _118 = _116;
        if (!_118)
        {
            _120 = true;
        }
    }
    float _154;
    float _156;
    float _158;
    float _160;
    if (!_118)
    {
        if (!_120)
        {
            float _122 = _104 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _124 = _104 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _126 = _104 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _128 = _104 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _130 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
            float _132 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
            float _134 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
            float _136 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[3].x, _128);
            float _138 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
            float _140 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
            float _142 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
            float _144 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _136);
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _154 = _152;
            _156 = _146;
            _158 = _148;
            _160 = _150;
        }
    }
    if ((false || _120) || _118)
    {
        if ((!_120) || _118)
        {
            _118 = false;
            float _162 = _104 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _164 = _104 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _166 = _104 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _168 = _104 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _170 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[4].x, _162);
            float _172 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[5].x, _164);
            float _174 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[6].x, _166);
            float _176 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[7].x, _168);
            float _178 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _170);
            float _180 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _172);
            float _182 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _174);
            float _184 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _176);
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _154 = _192;
            _156 = _186;
            _158 = _188;
            _160 = _190;
        }
        if (false || _120)
        {
            _120 = false;
            float _194 = _104 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _196 = _104 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _198 = _104 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _200 = _104 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _202 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[8].x, _194);
            float _204 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[9].x, _196);
            float _206 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[10].x, _198);
            float _208 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[11].x, _200);
            float _210 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _202);
            float _212 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _204);
            float _214 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _206);
            float _216 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _208);
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _154 = _224;
            _156 = _218;
            _158 = _220;
            _160 = _222;
        }
    }
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = _104 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _236 = _104 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _238 = 1.0 / _226;
    float _240 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[15].x, _234);
    float _242 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[13].x, _236);
    float _244 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _240);
    float _246 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _242);
    float _248 = _244 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _250 = _104 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _252 = _246 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _254 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[12].x, _250);
    float _256 = 1.0 / _248;
    float _258 = _238 * _228;
    float _260 = _238 * _230;
    float _262 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _254);
    float _264 = _238 * _232;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = _262 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _270 = _268 * _256;
    float _272 = _252 * _256;
    float _274 = float(int(_96));
    float2 _829 = float2(_270, _272);
    float2 _278 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_829, float2(0.0), isnan(_829))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_829, float2(0.0), isnan(_829))).xy;
    float _280 = _278.x;
    float _282 = _278.y;
    float _284 = rint(_274);
    float _286 = precise::max(_284, 0.0);
    uint _288 = uint(_286);
    uint _290 = clamp(_288, 0u, 65535u);
    float3 _855 = float3(_258, _260, float(int(_290)));
    float3 _859 = select(_855, float3(0.0), isnan(_855));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _859.xy, uint(rint(_859.z)), _266);
    float _294 = _104 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _296 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[14].x, _294);
    float _298 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _296);
    float _300 = _298 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _302 = precise::min(_300, 1.0);
    float _304 = -_62;
    float _306 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _308 = _304 + _306;
    float _310 = _308 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = -_280;
    float _316 = fma(_314, _280, _282);
    float _318 = -_280;
    float _320 = _302 + _318;
    float _322 = -_62;
    float _324 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _326 = _322 + _324;
    float _328 = fma(_320, _320, _316);
    bool _330 = _320 <= 0.001000000047497451305389404296875;
    float _332 = float(_330);
    float _334 = _326 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = 1.0 / _328;
    float _340 = _292 + _336;
    float _342 = _316 * _338;
    float _344 = precise::max(_342, _332);
    float _346 = precise::min(_344, 1.0);
    float _348 = _346 + _312;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _340;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _348;
    return out;
}

