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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d_array<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
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
int _40(thread const int& _908, thread const int& _909, constant _10& support_buffer)
{
    int _912 = 1 + _909;
    float _914 = support_buffer._m5[_912].x;
    float _916 = abs(_914);
    bool _919 = _916 == 1.0;
    if (_919)
    {
        return _908;
    }
    float _921 = float(_908);
    float _923 = _921 / _916;
    int _925 = int(_923);
    return _925;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _43 = int3(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height(), spvDescriptorSet0.fp_t_tcb_8.get_array_size()).x;
    int _45 = _43;
    int _47 = 0;
    int _49 = _40(_45, _47, (*spvDescriptorSet0.support_buffer));
    int _51 = int3(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height(), spvDescriptorSet0.fp_t_tcb_8.get_array_size()).y;
    int _53 = _51;
    int _55 = 0;
    int _57 = _40(_53, _55, (*spvDescriptorSet0.support_buffer));
    float _60 = gl_FragCoord.w;
    float _62 = in.m_31.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_31.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_31.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _60;
    float _82 = _80 * _66;
    float _84 = float(_49);
    float _86 = _80 * _72;
    float _88 = float(_57);
    float _90 = _80 * _78;
    float _92 = fma(_82, _84, -0.5);
    float _94 = fma(_86, _88, -0.5);
    float _96 = floor(_92);
    float _98 = floor(_94);
    float _100 = -_96;
    float _102 = _92 + _100;
    float _104 = rint(_90);
    float _106 = precise::max(_104, 0.0);
    uint _109 = uint(_106);
    uint _111 = clamp(_109, 0u, 65535u);
    float _113 = -_102;
    float _115 = _113 + 1.0;
    float _117 = -_102;
    float _119 = _117 + 2.0;
    float _121 = -_98;
    float _123 = _94 + _121;
    float _125 = _115 * _115;
    float _127 = 1.0 / _84;
    float _129 = -_123;
    float _131 = _129 + 1.0;
    float _133 = _115 * _125;
    float _135 = -_123;
    float _137 = _135 + 2.0;
    float _139 = _119 * _119;
    float _141 = _131 * _131;
    float _143 = -_133;
    float _145 = _143 + 6.0;
    float _147 = _137 * _137;
    float _149 = _131 * _141;
    float _151 = _133 * 4.0;
    float _153 = _149 * 4.0;
    float _155 = -_151;
    float _157 = fma(_119, _139, _155);
    float _159 = -_149;
    float _161 = _159 + 6.0;
    float _163 = 1.0 / _88;
    float _165 = -_153;
    float _167 = fma(_137, _147, _165);
    float _169 = -_157;
    float _171 = _169 + _145;
    float _173 = _123 * _123;
    float _175 = -_167;
    float _177 = _175 + _161;
    float _179 = _171 * 0.16666667163372039794921875;
    float _181 = _149 + _167;
    float _183 = _123 * _173;
    float _185 = _177 * 0.16666667163372039794921875;
    float _187 = _133 + _157;
    float _189 = _181 * 0.16666667163372039794921875;
    float _191 = 1.0 / _179;
    float _193 = _102 * _102;
    float _195 = _187 * 0.16666667163372039794921875;
    float _197 = _96 + (-0.5);
    float _199 = _96 + 1.5;
    float _201 = _102 * _193;
    float _203 = _157 * 0.16666667163372039794921875;
    float _205 = _98 + (-0.5);
    float _207 = 1.0 / _195;
    float _209 = _201 * 0.16666667163372039794921875;
    float _211 = _167 * 0.16666667163372039794921875;
    float _213 = _98 + 1.5;
    float _215 = _183 * 0.16666667163372039794921875;
    float _217 = 1.0 / _189;
    float _219 = fma(_209, _191, _199);
    float _221 = 1.0 / _185;
    float _223 = fma(_203, _207, _197);
    float _225 = _219 * _127;
    float _227 = _223 * _127;
    float _229 = fma(_211, _217, _205);
    float _231 = fma(_215, _221, _213);
    float _233 = _229 * _163;
    float _235 = _231 * _163;
    float3 _635 = float3(_225, _233, float(int(_111)));
    float3 _640 = select(_635, float3(0.0), isnan(_635));
    float4 _238 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _640.xy, uint(rint(_640.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _640.xy, uint(rint(_640.z))).xyzw;
    float _240 = _238.x;
    float _242 = _238.y;
    float _244 = _238.z;
    float _246 = _238.w;
    float3 _657 = float3(_227, _233, float(int(_111)));
    float3 _659 = select(_657, float3(0.0), isnan(_657));
    float4 _248 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _659.xy, uint(rint(_659.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _659.xy, uint(rint(_659.z))).xyzw;
    float _250 = _248.x;
    float _252 = _248.y;
    float _254 = _248.z;
    float _256 = _248.w;
    float3 _676 = float3(_227, _235, float(int(_111)));
    float3 _678 = select(_676, float3(0.0), isnan(_676));
    float4 _258 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _678.xy, uint(rint(_678.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _678.xy, uint(rint(_678.z))).xyzw;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    float _266 = _258.w;
    float3 _695 = float3(_225, _235, float(int(_111)));
    float3 _697 = select(_695, float3(0.0), isnan(_695));
    float4 _268 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _697.xy, uint(rint(_697.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _697.xy, uint(rint(_697.z))).xyzw;
    float _270 = _268.x;
    float _272 = _268.y;
    float _274 = _268.z;
    float _276 = _268.w;
    float3 _714 = float3(_82, _86, float(int(_111)));
    float3 _716 = select(_714, float3(0.0), isnan(_714));
    float4 _278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _716.xy, uint(rint(_716.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _716.xy, uint(rint(_716.z))).xyzw;
    float _280 = _278.x;
    float _282 = _278.y;
    float _284 = _278.z;
    float _286 = _278.w;
    float _288 = -_240;
    float _290 = _250 + _288;
    float _292 = -_242;
    float _294 = _252 + _292;
    float _296 = -_244;
    float _298 = _254 + _296;
    float _300 = -_272;
    float _302 = _262 + _300;
    float _304 = -_246;
    float _306 = _256 + _304;
    float _308 = fma(_195, _294, _242);
    float _310 = -_270;
    float _312 = _260 + _310;
    float _314 = -_274;
    float _316 = _264 + _314;
    float _318 = fma(_195, _302, _272);
    float _320 = -_276;
    float _322 = _266 + _320;
    float _324 = fma(_195, _290, _240);
    float _326 = fma(_195, _298, _244);
    float _328 = fma(_195, _306, _246);
    float _330 = fma(_195, _312, _270);
    float _332 = fma(_195, _316, _274);
    float _334 = -_318;
    float _336 = _334 + _308;
    float _338 = fma(_195, _322, _276);
    float _340 = -_330;
    float _342 = _340 + _324;
    float _344 = -_332;
    float _346 = _344 + _326;
    float _348 = fma(_189, _336, _318);
    float _350 = -_338;
    float _352 = _350 + _328;
    float _354 = fma(_189, _342, _330);
    float _356 = fma(_189, _346, _332);
    float _358 = fma(_189, _352, _338);
    float _360 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _362 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[7].y);
    float _364 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[6].z, (*spvDescriptorSet0.fp_c3)._m0[7].z);
    float _366 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[6].w, (*spvDescriptorSet0.fp_c3)._m0[7].w);
    float _368 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[5].x, _360);
    float _370 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[5].y, _362);
    float _372 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[5].z, _364);
    float _374 = fma(_358, (*spvDescriptorSet0.fp_c3)._m0[5].w, _366);
    float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_34.x = _376;
    out.m_34.y = _378;
    out.m_34.z = _380;
    out.m_34.w = _382;
    return out;
}

