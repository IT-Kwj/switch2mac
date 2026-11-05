#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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

struct _31
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c11 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c7 [[id(2)]];
    constant _16* vp_c6 [[id(3)]];
    constant _16* vp_c4 [[id(4)]];
    const device _31* vp_s0 [[id(5)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(0)]];
    float4 m_43 [[attribute(5)]];
    uint4 m_38 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _247 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = as_type<float>(in.m_38.x);
    float _59 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _61 = in.m_41.x;
    float _63 = in.m_41.y;
    float _65 = in.m_41.z;
    float _67 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _69 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _67;
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _73 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _71;
    float _75 = _69 * _69;
    int _78 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _80 = _78 + as_type<int>(_57);
    int _82 = _80 * 48;
    int _84 = _82 + 16;
    int _86 = _82 + 32;
    int _88 = _82 + 48;
    uint _91 = uint(int(uint(_84) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_91)];
    float _93 = as_type<float>(_dmw0.x);
    int _95 = _84 + 4;
    uint _97 = uint(int(uint(_95) >> uint(2)));
    float _99 = as_type<float>(_dmw0.y);
    int _101 = _84 + 8;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    float _105 = as_type<float>(_dmw0.z);
    int _107 = _84 + 12;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    float _111 = as_type<float>(_dmw0.w);
    uint _113 = uint(int(uint(_86) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_113)];
    float _115 = as_type<float>(_dmw1.x);
    int _117 = _86 + 4;
    uint _119 = uint(int(uint(_117) >> uint(2)));
    float _121 = as_type<float>(_dmw1.y);
    int _123 = _86 + 8;
    uint _125 = uint(int(uint(_123) >> uint(2)));
    float _127 = as_type<float>(_dmw1.z);
    int _129 = _86 + 12;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    float _133 = as_type<float>(_dmw1.w);
    uint _135 = uint(int(uint(_88) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_135)];
    float _137 = as_type<float>(_dmw2.x);
    int _139 = _88 + 4;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>(_dmw2.y);
    int _145 = _88 + 8;
    uint _147 = uint(int(uint(_145) >> uint(2)));
    float _149 = as_type<float>(_dmw2.z);
    int _151 = _88 + 12;
    uint _153 = uint(int(uint(_151) >> uint(2)));
    float _155 = as_type<float>(_dmw2.w);
    float _157 = fma(_73, _73, _75);
    float _159 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _161 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _159;
    float _163 = fma(_161, _161, _157);
    float _165 = in.m_43.x;
    float _167 = sqrt(_163);
    bool _171 = _167 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _173 = isnan(_167);
    bool _175 = _171 || _173;
    bool _177 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _179 = _175 || _177;
    float _181 = _99 * _63;
    float _183 = _121 * _63;
    float _185 = fma(_93, _61, _181);
    float _187 = _143 * _63;
    float _189 = fma(_115, _61, _183);
    float _191 = fma(_105, _65, _185);
    float _193 = fma(_137, _61, _187);
    float _195 = fma(_127, _65, _189);
    float _197 = _111 + _191;
    float _199 = _137;
    if (!_179)
    {
        _199 = 1.0;
    }
    float _201 = _199;
    float _203 = fma(_149, _65, _193);
    float _205 = _133 + _195;
    float _207 = _197 * _165;
    float _209 = _155 + _203;
    float _211 = _205 * _165;
    float _213 = _209 * _165;
    bool _215 = !_179;
    float _217 = _201;
    if (!_215)
    {
        bool _219 = _167 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _221 = isnan(_167);
        bool _223 = _219 || _221;
        bool _225 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _227 = _223 || _225;
        if (!_227)
        {
            float _229 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _231 = _167 + _229;
            float _233 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _235 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _233;
            float _237 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _239 = _237 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _241 = 1.0 / _235;
            float _243 = _231 * _241;
            float _245 = fma(_243, _239, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _217 = _245;
            _247 = true;
        }
        else
        {
            bool _249 = _167 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _251 = isnan(_167);
            bool _253 = _249 || _251;
            bool _255 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _257 = _253 || _255;
            if (!_257)
            {
                float _259 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _261 = _167 + _259;
                float _263 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _265 = _263 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _267 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _269 = _267 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _271 = 1.0 / _265;
                float _273 = _261 * _271;
                float _275 = fma(_273, _269, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _217 = _275;
                _247 = true;
            }
            else
            {
                _217 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _247 = false;
    float _277 = _217;
    float _279 = _277 + (-1.0);
    float _281 = _279 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _283 = _279 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _285 = _279 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _287 = fma(_211, _277, _281);
    float _289 = fma(_207, _277, _283);
    float _291 = fma(_213, _277, _285);
    float _293 = _287 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _295 = _287 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _297 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[2].x, _293);
    float _299 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[0].x, _295);
    float _301 = _287 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _303 = fma(_291, (*spvDescriptorSet0.vp_c7)._m0[2].z, _297);
    float _305 = fma(_291, (*spvDescriptorSet0.vp_c7)._m0[0].z, _299);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[1].x, _301);
    float _309 = _303 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _311 = _305 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _313 = fma(_291, (*spvDescriptorSet0.vp_c7)._m0[1].z, _307);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _317 = _309 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _321 = _311 + _319;
    float _323 = _313 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _325 = _317 * _317;
    float _327 = _323 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _329 = fma(_321, _321, _325);
    float _331 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[2].x, _327);
    float _333 = sqrt(_329);
    float _335 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[2].z, _331);
    float _337 = _335 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _339 = _333 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _341 = _291;
    float _343 = _335;
    float _345 = _313;
    float _347 = _337;
    if (!_339)
    {
        _341 = _311;
    }
    float _349 = _341;
    float _351 = _349;
    if (!_339)
    {
        _343 = _309;
    }
    float _353 = _343;
    float _355 = _353;
    if (!_339)
    {
        _345 = _323;
    }
    float _357 = _345;
    bool _359 = !_339;
    float _361 = _357;
    if (!_359)
    {
        float _363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _365 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _367 = _333 + _365;
        float _369 = rsqrt(_329);
        float _371 = _367 * _363;
        float _373 = _323 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _375 = _371 * 0.15915493667125701904296875;
        float _377 = _375 * 6.283185482025146484375;
        float _379 = cos(_377);
        float _381 = _375 * 6.283185482025146484375;
        float _383 = sin(_381);
        float _385 = _379 + (-1.0);
        float _387 = _385 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _389 = fma(_383, _373, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _391 = fma(_323, _379, _387);
        float _393 = _369 * _389;
        float _395 = _391 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _397 = fma(_321, _393, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _399 = fma(_317, _393, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _401 = fma(_397, (*spvDescriptorSet0.vp_c4)._m0[2].x, _395);
        float _403 = fma(_399, (*spvDescriptorSet0.vp_c4)._m0[2].z, _401);
        float _405 = _403 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _361 = _391;
        _351 = _397;
        _355 = _399;
        _347 = _405;
    }
    float _407 = _361;
    float _409 = _351;
    float _411 = _355;
    float _413 = _347;
    float _415 = _407 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _417 = _407 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _419 = fma(_409, (*spvDescriptorSet0.vp_c4)._m0[1].x, _415);
    float _421 = fma(_409, (*spvDescriptorSet0.vp_c4)._m0[0].x, _417);
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[1].z, _419);
    float _425 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[0].z, _421);
    float _427 = _423 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _429 = _425 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _431 = _427 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _433 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[9].x, _431);
    float _435 = _427 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _437 = fma(_413, (*spvDescriptorSet0.vp_c4)._m0[9].z, _433);
    float _439 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[10].x, _435);
    float _441 = _437 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _443 = fma(_413, (*spvDescriptorSet0.vp_c4)._m0[10].z, _439);
    float _445 = _441 * 10000.0;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    float _449 = _443 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _451 = _447 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _453 = _427 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _455 = _427 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _457 = fma(_451, (*spvDescriptorSet0.vp_c4)._m0[10].z, _449);
    float _459 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[7].x, _453);
    float _461 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[8].x, _455);
    float _463 = fma(_451, (*spvDescriptorSet0.vp_c4)._m0[9].z, _441);
    float _465 = 1.0 / _457;
    float _467 = fma(_413, (*spvDescriptorSet0.vp_c4)._m0[7].z, _459);
    float _469 = fma(_413, (*spvDescriptorSet0.vp_c4)._m0[8].z, _461);
    float _471 = _467 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _473 = _469 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _475 = _449 * _465;
    float _477 = _463 * _475;
    out.gl_Position.x = _471;
    out.gl_Position.y = _473;
    out.gl_Position.z = _477;
    out.gl_Position.w = _449;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _247 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = as_type<float>(in.m_38.x);
    float _59 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _61 = in.m_41.x;
    float _63 = in.m_41.y;
    float _65 = in.m_41.z;
    float _67 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _69 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _67;
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _73 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _71;
    float _75 = _69 * _69;
    int _78 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _80 = _78 + as_type<int>(_57);
    int _82 = _80 * 48;
    int _84 = _82 + 16;
    int _86 = _82 + 32;
    int _88 = _82 + 48;
    uint _91 = uint(int(uint(_84) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_91)];
    float _93 = as_type<float>(_dmw0.x);
    int _95 = _84 + 4;
    uint _97 = uint(int(uint(_95) >> uint(2)));
    float _99 = as_type<float>(_dmw0.y);
    int _101 = _84 + 8;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    float _105 = as_type<float>(_dmw0.z);
    int _107 = _84 + 12;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    float _111 = as_type<float>(_dmw0.w);
    uint _113 = uint(int(uint(_86) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_113)];
    float _115 = as_type<float>(_dmw1.x);
    int _117 = _86 + 4;
    uint _119 = uint(int(uint(_117) >> uint(2)));
    float _121 = as_type<float>(_dmw1.y);
    int _123 = _86 + 8;
    uint _125 = uint(int(uint(_123) >> uint(2)));
    float _127 = as_type<float>(_dmw1.z);
    int _129 = _86 + 12;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    float _133 = as_type<float>(_dmw1.w);
    uint _135 = uint(int(uint(_88) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_135)];
    float _137 = as_type<float>(_dmw2.x);
    int _139 = _88 + 4;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>(_dmw2.y);
    int _145 = _88 + 8;
    uint _147 = uint(int(uint(_145) >> uint(2)));
    float _149 = as_type<float>(_dmw2.z);
    int _151 = _88 + 12;
    uint _153 = uint(int(uint(_151) >> uint(2)));
    float _155 = as_type<float>(_dmw2.w);
    float _157 = fma(_73, _73, _75);
    float _159 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _161 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _159;
    float _163 = fma(_161, _161, _157);
    float _165 = in.m_43.x;
    float _167 = sqrt(_163);
    bool _171 = _167 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _173 = isnan(_167);
    bool _175 = _171 || _173;
    bool _177 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _179 = _175 || _177;
    float _181 = _99 * _63;
    float _183 = _121 * _63;
    float _185 = fma(_93, _61, _181);
    float _187 = _143 * _63;
    float _189 = fma(_115, _61, _183);
    float _191 = fma(_105, _65, _185);
    float _193 = fma(_137, _61, _187);
    float _195 = fma(_127, _65, _189);
    float _197 = _111 + _191;
    float _199 = _137;
    if (!_179)
    {
        _199 = 1.0;
    }
    float _201 = _199;
    float _203 = fma(_149, _65, _193);
    float _205 = _133 + _195;
    float _207 = _197 * _165;
    float _209 = _155 + _203;
    float _211 = _205 * _165;
    float _213 = _209 * _165;
    bool _215 = !_179;
    float _217 = _201;
    if (!_215)
    {
        bool _219 = _167 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _221 = isnan(_167);
        bool _223 = _219 || _221;
        bool _225 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _227 = _223 || _225;
        if (!_227)
        {
            float _229 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _231 = _167 + _229;
            float _233 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _235 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _233;
            float _237 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _239 = _237 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _241 = 1.0 / _235;
            float _243 = _231 * _241;
            float _245 = fma(_243, _239, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _217 = _245;
            _247 = true;
        }
        else
        {
            bool _249 = _167 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _251 = isnan(_167);
            bool _253 = _249 || _251;
            bool _255 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _257 = _253 || _255;
            if (!_257)
            {
                float _259 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _261 = _167 + _259;
                float _263 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _265 = _263 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _267 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _269 = _267 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _271 = 1.0 / _265;
                float _273 = _261 * _271;
                float _275 = fma(_273, _269, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _217 = _275;
                _247 = true;
            }
            else
            {
                _217 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _247 = false;
    float _277 = _217;
    float _279 = _277 + (-1.0);
    float _281 = _279 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _283 = _279 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _285 = _279 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _287 = fma(_211, _277, _281);
    float _289 = fma(_207, _277, _283);
    float _291 = fma(_213, _277, _285);
    float _293 = _287 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _295 = _287 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _297 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[2].x, _293);
    float _299 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[0].x, _295);
    float _301 = _287 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _303 = fma(_291, (*spvDescriptorSet0.vp_c7)._m0[2].z, _297);
    float _305 = fma(_291, (*spvDescriptorSet0.vp_c7)._m0[0].z, _299);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[1].x, _301);
    float _309 = _303 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _311 = _305 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _313 = fma(_291, (*spvDescriptorSet0.vp_c7)._m0[1].z, _307);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _317 = _309 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _321 = _311 + _319;
    float _323 = _313 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _325 = _317 * _317;
    float _327 = _323 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _329 = fma(_321, _321, _325);
    float _331 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[2].x, _327);
    float _333 = sqrt(_329);
    float _335 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[2].z, _331);
    float _337 = _335 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _339 = _333 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _341 = _291;
    float _343 = _335;
    float _345 = _313;
    float _347 = _337;
    if (!_339)
    {
        _341 = _311;
    }
    float _349 = _341;
    float _351 = _349;
    if (!_339)
    {
        _343 = _309;
    }
    float _353 = _343;
    float _355 = _353;
    if (!_339)
    {
        _345 = _323;
    }
    float _357 = _345;
    bool _359 = !_339;
    float _361 = _357;
    if (!_359)
    {
        float _363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _365 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _367 = _333 + _365;
        float _369 = rsqrt(_329);
        float _371 = _367 * _363;
        float _373 = _323 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _375 = _371 * 0.15915493667125701904296875;
        float _377 = _375 * 6.283185482025146484375;
        float _379 = cos(_377);
        float _381 = _375 * 6.283185482025146484375;
        float _383 = sin(_381);
        float _385 = _379 + (-1.0);
        float _387 = _385 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _389 = fma(_383, _373, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _391 = fma(_323, _379, _387);
        float _393 = _369 * _389;
        float _395 = _391 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _397 = fma(_321, _393, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _399 = fma(_317, _393, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _401 = fma(_397, (*spvDescriptorSet0.vp_c4)._m0[2].x, _395);
        float _403 = fma(_399, (*spvDescriptorSet0.vp_c4)._m0[2].z, _401);
        float _405 = _403 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _361 = _391;
        _351 = _397;
        _355 = _399;
        _347 = _405;
    }
    float _407 = _361;
    float _409 = _351;
    float _411 = _355;
    float _413 = _347;
    float _415 = _407 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _417 = _407 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _419 = fma(_409, (*spvDescriptorSet0.vp_c4)._m0[1].x, _415);
    float _421 = fma(_409, (*spvDescriptorSet0.vp_c4)._m0[0].x, _417);
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[1].z, _419);
    float _425 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[0].z, _421);
    float _427 = _423 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _429 = _425 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _431 = _427 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _433 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[9].x, _431);
    float _435 = _427 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _437 = fma(_413, (*spvDescriptorSet0.vp_c4)._m0[9].z, _433);
    float _439 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[10].x, _435);
    float _441 = _437 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _443 = fma(_413, (*spvDescriptorSet0.vp_c4)._m0[10].z, _439);
    float _445 = _441 * 10000.0;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    float _449 = _443 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _451 = _447 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _453 = _427 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _455 = _427 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _457 = fma(_451, (*spvDescriptorSet0.vp_c4)._m0[10].z, _449);
    float _459 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[7].x, _453);
    float _461 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[8].x, _455);
    float _463 = fma(_451, (*spvDescriptorSet0.vp_c4)._m0[9].z, _441);
    float _465 = 1.0 / _457;
    float _467 = fma(_413, (*spvDescriptorSet0.vp_c4)._m0[7].z, _459);
    float _469 = fma(_413, (*spvDescriptorSet0.vp_c4)._m0[8].z, _461);
    float _471 = _467 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _473 = _469 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _475 = _449 * _465;
    float _477 = _463 * _475;
    out.gl_Position.x = _471;
    out.gl_Position.y = _473;
    out.gl_Position.z = _477;
    out.gl_Position.w = _449;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    bool _247 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = as_type<float>(in.m_38.x);
    float _59 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _61 = in.m_41.x;
    float _63 = in.m_41.y;
    float _65 = in.m_41.z;
    float _67 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _69 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _67;
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _73 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _71;
    float _75 = _69 * _69;
    int _78 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _80 = _78 + as_type<int>(_57);
    int _82 = _80 * 48;
    int _84 = _82 + 16;
    int _86 = _82 + 32;
    int _88 = _82 + 48;
    uint _91 = uint(int(uint(_84) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_91)];
    float _93 = as_type<float>(_dmw0.x);
    int _95 = _84 + 4;
    uint _97 = uint(int(uint(_95) >> uint(2)));
    float _99 = as_type<float>(_dmw0.y);
    int _101 = _84 + 8;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    float _105 = as_type<float>(_dmw0.z);
    int _107 = _84 + 12;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    float _111 = as_type<float>(_dmw0.w);
    uint _113 = uint(int(uint(_86) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_113)];
    float _115 = as_type<float>(_dmw1.x);
    int _117 = _86 + 4;
    uint _119 = uint(int(uint(_117) >> uint(2)));
    float _121 = as_type<float>(_dmw1.y);
    int _123 = _86 + 8;
    uint _125 = uint(int(uint(_123) >> uint(2)));
    float _127 = as_type<float>(_dmw1.z);
    int _129 = _86 + 12;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    float _133 = as_type<float>(_dmw1.w);
    uint _135 = uint(int(uint(_88) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_135)];
    float _137 = as_type<float>(_dmw2.x);
    int _139 = _88 + 4;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>(_dmw2.y);
    int _145 = _88 + 8;
    uint _147 = uint(int(uint(_145) >> uint(2)));
    float _149 = as_type<float>(_dmw2.z);
    int _151 = _88 + 12;
    uint _153 = uint(int(uint(_151) >> uint(2)));
    float _155 = as_type<float>(_dmw2.w);
    float _157 = fma(_73, _73, _75);
    float _159 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _161 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _159;
    float _163 = fma(_161, _161, _157);
    float _165 = in.m_43.x;
    float _167 = sqrt(_163);
    bool _171 = _167 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _173 = isnan(_167);
    bool _175 = _171 || _173;
    bool _177 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _179 = _175 || _177;
    float _181 = _99 * _63;
    float _183 = _121 * _63;
    float _185 = fma(_93, _61, _181);
    float _187 = _143 * _63;
    float _189 = fma(_115, _61, _183);
    float _191 = fma(_105, _65, _185);
    float _193 = fma(_137, _61, _187);
    float _195 = fma(_127, _65, _189);
    float _197 = _111 + _191;
    float _199 = _137;
    if (!_179)
    {
        _199 = 1.0;
    }
    float _201 = _199;
    float _203 = fma(_149, _65, _193);
    float _205 = _133 + _195;
    float _207 = _197 * _165;
    float _209 = _155 + _203;
    float _211 = _205 * _165;
    float _213 = _209 * _165;
    bool _215 = !_179;
    float _217 = _201;
    if (!_215)
    {
        bool _219 = _167 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _221 = isnan(_167);
        bool _223 = _219 || _221;
        bool _225 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _227 = _223 || _225;
        if (!_227)
        {
            float _229 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _231 = _167 + _229;
            float _233 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _235 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _233;
            float _237 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _239 = _237 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _241 = 1.0 / _235;
            float _243 = _231 * _241;
            float _245 = fma(_243, _239, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _217 = _245;
            _247 = true;
        }
        else
        {
            bool _249 = _167 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _251 = isnan(_167);
            bool _253 = _249 || _251;
            bool _255 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _257 = _253 || _255;
            if (!_257)
            {
                float _259 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _261 = _167 + _259;
                float _263 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _265 = _263 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _267 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _269 = _267 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _271 = 1.0 / _265;
                float _273 = _261 * _271;
                float _275 = fma(_273, _269, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _217 = _275;
                _247 = true;
            }
            else
            {
                _217 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _247 = false;
    float _277 = _217;
    float _279 = _277 + (-1.0);
    float _281 = _279 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _283 = _279 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _285 = _279 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _287 = fma(_211, _277, _281);
    float _289 = fma(_207, _277, _283);
    float _291 = fma(_213, _277, _285);
    float _293 = _287 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _295 = _287 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _297 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[2].x, _293);
    float _299 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[0].x, _295);
    float _301 = _287 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _303 = fma(_291, (*spvDescriptorSet0.vp_c7)._m0[2].z, _297);
    float _305 = fma(_291, (*spvDescriptorSet0.vp_c7)._m0[0].z, _299);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c7)._m0[1].x, _301);
    float _309 = _303 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _311 = _305 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _313 = fma(_291, (*spvDescriptorSet0.vp_c7)._m0[1].z, _307);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _317 = _309 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _321 = _311 + _319;
    float _323 = _313 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _325 = _317 * _317;
    float _327 = _323 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _329 = fma(_321, _321, _325);
    float _331 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[2].x, _327);
    float _333 = sqrt(_329);
    float _335 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[2].z, _331);
    float _337 = _335 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _339 = _333 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _341 = _291;
    float _343 = _335;
    float _345 = _313;
    float _347 = _337;
    if (!_339)
    {
        _341 = _311;
    }
    float _349 = _341;
    float _351 = _349;
    if (!_339)
    {
        _343 = _309;
    }
    float _353 = _343;
    float _355 = _353;
    if (!_339)
    {
        _345 = _323;
    }
    float _357 = _345;
    bool _359 = !_339;
    float _361 = _357;
    if (!_359)
    {
        float _363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _365 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _367 = _333 + _365;
        float _369 = rsqrt(_329);
        float _371 = _367 * _363;
        float _373 = _323 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _375 = _371 * 0.15915493667125701904296875;
        float _377 = _375 * 6.283185482025146484375;
        float _379 = cos(_377);
        float _381 = _375 * 6.283185482025146484375;
        float _383 = sin(_381);
        float _385 = _379 + (-1.0);
        float _387 = _385 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _389 = fma(_383, _373, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _391 = fma(_323, _379, _387);
        float _393 = _369 * _389;
        float _395 = _391 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _397 = fma(_321, _393, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _399 = fma(_317, _393, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _401 = fma(_397, (*spvDescriptorSet0.vp_c4)._m0[2].x, _395);
        float _403 = fma(_399, (*spvDescriptorSet0.vp_c4)._m0[2].z, _401);
        float _405 = _403 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _361 = _391;
        _351 = _397;
        _355 = _399;
        _347 = _405;
    }
    float _407 = _361;
    float _409 = _351;
    float _411 = _355;
    float _413 = _347;
    float _415 = _407 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _417 = _407 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _419 = fma(_409, (*spvDescriptorSet0.vp_c4)._m0[1].x, _415);
    float _421 = fma(_409, (*spvDescriptorSet0.vp_c4)._m0[0].x, _417);
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[1].z, _419);
    float _425 = fma(_411, (*spvDescriptorSet0.vp_c4)._m0[0].z, _421);
    float _427 = _423 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _429 = _425 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _431 = _427 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _433 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[9].x, _431);
    float _435 = _427 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _437 = fma(_413, (*spvDescriptorSet0.vp_c4)._m0[9].z, _433);
    float _439 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[10].x, _435);
    float _441 = _437 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _443 = fma(_413, (*spvDescriptorSet0.vp_c4)._m0[10].z, _439);
    float _445 = _441 * 10000.0;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    float _449 = _443 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _451 = _447 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _453 = _427 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _455 = _427 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _457 = fma(_451, (*spvDescriptorSet0.vp_c4)._m0[10].z, _449);
    float _459 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[7].x, _453);
    float _461 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[8].x, _455);
    float _463 = fma(_451, (*spvDescriptorSet0.vp_c4)._m0[9].z, _441);
    float _465 = 1.0 / _457;
    float _467 = fma(_413, (*spvDescriptorSet0.vp_c4)._m0[7].z, _459);
    float _469 = fma(_413, (*spvDescriptorSet0.vp_c4)._m0[8].z, _461);
    float _471 = _467 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _473 = _469 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _475 = _449 * _465;
    float _477 = _463 * _475;
    out.gl_Position.x = _471;
    out.gl_Position.y = _473;
    out.gl_Position.z = _477;
    out.gl_Position.w = _449;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

