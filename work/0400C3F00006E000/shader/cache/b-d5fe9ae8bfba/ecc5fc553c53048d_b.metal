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
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
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
    bool _110 = false;
    bool _108 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _331 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_331, float2(0.0), isnan(_331))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_331, float2(0.0), isnan(_331))).x;
    float _54 = in.m_38.y;
    float _56 = -_52;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _54;
    float _64 = -_60;
    bool _68 = _64 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _70 = -_60;
    bool _72 = _70 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _74 = !_68;
    uint _77 = uint(_74 ? 0 : 1);
    uint _79 = 2u;
    if (!_68)
    {
        _79 = 1u;
    }
    uint _81 = _79;
    uint _83 = _81;
    if (!_72)
    {
        _83 = _77;
    }
    uint _85 = _83;
    uint _87 = min(_85, 2u);
    int _90 = int(_87) << 2;
    float _92 = in.m_38.x;
    uint _94 = uint(int(uint(_90) >> uint(2)));
    uint _96 = uint(int(uint(int(_94)) >> uint(2)));
    int _98 = int(_94) & 3;
    float _100 = (*spvDescriptorSet0.fp_c1)._m0[int(_96)][_98];
    float _102 = _60 * _92;
    bool _104 = as_type<int>(_100) == 336;
    if (!_104)
    {
        bool _106 = as_type<int>(_100) == 608;
        _108 = _106;
        if (!_108)
        {
            _110 = true;
        }
    }
    float _144;
    float _146;
    float _148;
    float _150;
    if (!_108)
    {
        if (!_110)
        {
            float _112 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _114 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _116 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _118 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _120 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[0].x, _112);
            float _122 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[1].x, _114);
            float _124 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[2].x, _116);
            float _126 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[3].x, _118);
            float _128 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _120);
            float _130 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _122);
            float _132 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _124);
            float _134 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _126);
            float _136 = _128 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _144 = _142;
            _146 = _136;
            _148 = _140;
            _150 = _138;
        }
    }
    if ((false || _110) || _108)
    {
        if ((!_110) || _108)
        {
            _108 = false;
            float _152 = _62 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _154 = _62 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _156 = _62 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _158 = _62 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _160 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[4].x, _152);
            float _162 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[5].x, _154);
            float _164 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[6].x, _156);
            float _166 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[7].x, _158);
            float _168 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[4].z, _160);
            float _170 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[5].z, _162);
            float _172 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[6].z, _164);
            float _174 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[7].z, _166);
            float _176 = _168 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _178 = _170 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _144 = _182;
            _146 = _176;
            _148 = _180;
            _150 = _178;
        }
        if (false || _110)
        {
            _110 = false;
            float _184 = _62 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _186 = _62 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _188 = _62 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _190 = _62 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _192 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[8].x, _184);
            float _194 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[9].x, _186);
            float _196 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[10].x, _188);
            float _198 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[11].x, _190);
            float _200 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[8].z, _192);
            float _202 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[9].z, _194);
            float _204 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].z, _196);
            float _206 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[11].z, _198);
            float _208 = _200 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _210 = _202 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _144 = _214;
            _146 = _208;
            _148 = _212;
            _150 = _210;
        }
    }
    float _216 = _144;
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = float(int(_85));
    float _226 = 1.0 / _216;
    float _228 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _230 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _232 = rint(_224);
    float _234 = precise::max(_232, 0.0);
    uint _236 = uint(_234);
    uint _238 = clamp(_236, 0u, 65535u);
    float _240 = _226 * _218;
    float _242 = _226 * _220;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _226 * _222;
    float _248 = fma(_244, _228, _240);
    float _250 = -_228;
    float _252 = fma(_244, _250, _240);
    float _254 = fma(_244, _230, _246);
    float _256 = -_230;
    float _258 = fma(_244, _256, _246);
    float3 _765 = float3(_240, _254, float(int(_238)));
    float3 _769 = select(_765, float3(0.0), isnan(_765));
    float _260 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _769.xy, uint(rint(_769.z)), _244);
    float3 _778 = float3(_248, _254, float(int(_238)));
    float3 _780 = select(_778, float3(0.0), isnan(_778));
    float _262 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _780.xy, uint(rint(_780.z)), _244);
    float3 _789 = float3(_252, _254, float(int(_238)));
    float3 _791 = select(_789, float3(0.0), isnan(_789));
    float _264 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _791.xy, uint(rint(_791.z)), _244);
    float3 _800 = float3(_248, _246, float(int(_238)));
    float3 _802 = select(_800, float3(0.0), isnan(_800));
    float _266 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _802.xy, uint(rint(_802.z)), _244);
    float3 _811 = float3(_240, _246, float(int(_238)));
    float3 _813 = select(_811, float3(0.0), isnan(_811));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _813.xy, uint(rint(_813.z)), _244);
    float3 _822 = float3(_252, _246, float(int(_238)));
    float3 _824 = select(_822, float3(0.0), isnan(_822));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _824.xy, uint(rint(_824.z)), _244);
    float3 _833 = float3(_248, _258, float(int(_238)));
    float3 _835 = select(_833, float3(0.0), isnan(_833));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _835.xy, uint(rint(_835.z)), _244);
    float3 _844 = float3(_240, _258, float(int(_238)));
    float3 _846 = select(_844, float3(0.0), isnan(_844));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _846.xy, uint(rint(_846.z)), _244);
    float3 _855 = float3(_252, _258, float(int(_238)));
    float3 _857 = select(_855, float3(0.0), isnan(_855));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _857.xy, uint(rint(_857.z)), _244);
    float2 _863 = float2(_48, _50);
    float _278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_863, float2(0.0), isnan(_863))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_863, float2(0.0), isnan(_863))).x;
    float _280 = -_60;
    float _282 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _284 = _280 + _282;
    float _286 = -_60;
    float _288 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _290 = _286 + _288;
    float _292 = _284 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = _290 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = _298 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _302 = _262 + _260;
    float _304 = _302 + _264;
    float _306 = _304 + _266;
    float _308 = _306 + _268;
    float _310 = _308 + _270;
    float _312 = _310 + _272;
    float _314 = _312 + _274;
    float _316 = _314 + _276;
    float _318 = fma(_316, 0.111111111938953399658203125, _294);
    out.m_41.x = _278;
    out.m_41.y = _318;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _300;
    return out;
}

