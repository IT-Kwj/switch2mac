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
    float2 _367 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_367, float2(0.0), isnan(_367))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_367, float2(0.0), isnan(_367))).x;
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
            _146 = _140;
            _148 = _136;
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
            _146 = _180;
            _148 = _176;
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
            _146 = _212;
            _148 = _208;
            _150 = _210;
        }
    }
    float _216 = _144;
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = 1.0 / _216;
    float _226 = float(int(_85));
    float _228 = rint(_226);
    float _230 = precise::max(_228, 0.0);
    uint _232 = uint(_230);
    uint _234 = clamp(_232, 0u, 65535u);
    float _236 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _238 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _240 = _224 * _218;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _224 * _220;
    float _246 = _224 * _222;
    float _248 = _242 * _236;
    float _250 = _242 * _238;
    float _252 = fma(_248, 0.5, _244);
    float _254 = fma(_248, 1.5, _244);
    float _256 = fma(_248, -0.5, _244);
    float _258 = fma(_248, -1.5, _244);
    float _260 = fma(_250, 1.5, _246);
    float _262 = fma(_250, 0.5, _246);
    float3 _809 = float3(_252, _260, float(int(_234)));
    float3 _813 = select(_809, float3(0.0), isnan(_809));
    float _264 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _813.xy, uint(rint(_813.z)), _242);
    float3 _822 = float3(_254, _260, float(int(_234)));
    float3 _824 = select(_822, float3(0.0), isnan(_822));
    float _266 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _824.xy, uint(rint(_824.z)), _242);
    float3 _833 = float3(_256, _260, float(int(_234)));
    float3 _835 = select(_833, float3(0.0), isnan(_833));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _835.xy, uint(rint(_835.z)), _242);
    float3 _844 = float3(_258, _260, float(int(_234)));
    float3 _846 = select(_844, float3(0.0), isnan(_844));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _846.xy, uint(rint(_846.z)), _242);
    float3 _855 = float3(_252, _262, float(int(_234)));
    float3 _857 = select(_855, float3(0.0), isnan(_855));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _857.xy, uint(rint(_857.z)), _242);
    float3 _866 = float3(_256, _262, float(int(_234)));
    float3 _868 = select(_866, float3(0.0), isnan(_866));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _868.xy, uint(rint(_868.z)), _242);
    float3 _877 = float3(_254, _262, float(int(_234)));
    float3 _879 = select(_877, float3(0.0), isnan(_877));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _879.xy, uint(rint(_879.z)), _242);
    float3 _888 = float3(_258, _262, float(int(_234)));
    float3 _890 = select(_888, float3(0.0), isnan(_888));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _890.xy, uint(rint(_890.z)), _242);
    float _280 = fma(_250, -0.5, _246);
    float3 _902 = float3(_254, _280, float(int(_234)));
    float3 _904 = select(_902, float3(0.0), isnan(_902));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _904.xy, uint(rint(_904.z)), _242);
    float3 _913 = float3(_252, _280, float(int(_234)));
    float3 _915 = select(_913, float3(0.0), isnan(_913));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _915.xy, uint(rint(_915.z)), _242);
    float3 _924 = float3(_256, _280, float(int(_234)));
    float3 _926 = select(_924, float3(0.0), isnan(_924));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _926.xy, uint(rint(_926.z)), _242);
    float3 _935 = float3(_258, _280, float(int(_234)));
    float3 _937 = select(_935, float3(0.0), isnan(_935));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _937.xy, uint(rint(_937.z)), _242);
    float _290 = fma(_250, -1.5, _246);
    float3 _949 = float3(_254, _290, float(int(_234)));
    float3 _951 = select(_949, float3(0.0), isnan(_949));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _951.xy, uint(rint(_951.z)), _242);
    float3 _960 = float3(_252, _290, float(int(_234)));
    float3 _962 = select(_960, float3(0.0), isnan(_960));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _962.xy, uint(rint(_962.z)), _242);
    float3 _971 = float3(_256, _290, float(int(_234)));
    float3 _973 = select(_971, float3(0.0), isnan(_971));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _973.xy, uint(rint(_973.z)), _242);
    float3 _982 = float3(_258, _290, float(int(_234)));
    float3 _984 = select(_982, float3(0.0), isnan(_982));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _984.xy, uint(rint(_984.z)), _242);
    float2 _990 = float2(_48, _50);
    float _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_990, float2(0.0), isnan(_990))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_990, float2(0.0), isnan(_990))).x;
    float _302 = -_60;
    float _304 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _306 = _302 + _304;
    float _308 = -_60;
    float _310 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _312 = _308 + _310;
    float _314 = _306 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = _312 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = _320 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _324 = _266 + _264;
    float _326 = _324 + _268;
    float _328 = _326 + _270;
    float _330 = _328 + _276;
    float _332 = _330 + _272;
    float _334 = _332 + _274;
    float _336 = _334 + _278;
    float _338 = _336 + _282;
    float _340 = _338 + _284;
    float _342 = _340 + _286;
    float _344 = _342 + _288;
    float _346 = _344 + _292;
    float _348 = _346 + _294;
    float _350 = _348 + _296;
    float _352 = _350 + _298;
    float _354 = fma(_352, 0.0625, _316);
    out.m_41.x = _300;
    out.m_41.y = _354;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _322;
    return out;
}

